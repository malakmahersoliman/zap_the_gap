import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zap_the_gap/model/task.dart';
import 'create_task_page.dart'; 
import 'package:zap_the_gap/db/task_db.dart'; // Use TaskDb here

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomePage({super.key, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Task> _tasks = []; // Store tasks from the database

  int _selectedIndex = 0; // Track the selected tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Fetch tasks from the database
  void _fetchTasks([DateTime? date]) async {
    final tasks = await TaskDb().getTasks(); // Use TaskDb to fetch tasks

    // If a date is selected, filter tasks by dueDate
    final filteredTasks = tasks.where((task) {
      return date == null || isSameDay(task.dueDate, date);
    }).toList();

    setState(() {
      _tasks = filteredTasks;
    });
  }

  void _toggleTaskCompletion(int taskId, bool isCompleted) async {
    await TaskDb().updateTaskCompletion(taskId, !isCompleted); 
    _fetchTasks(); 
  }


  void _navigateToCreateTask() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTaskPage(),
      ),
    ).then((_) => _fetchTasks()); 
  }

  @override
  void initState() {
    super.initState();
    _fetchTasks(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Zap the Gap",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: widget.toggleTheme, // Toggle theme when pressed
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                    _fetchTasks(selectedDay); // Fetch tasks for the selected day
                  },
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Display tasks
          Expanded(
child: _tasks.isEmpty
      ? Center(child: Text('No tasks for this day', style: TextStyle(fontSize: 18, color: Colors.grey)))
      : ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            return Dismissible(
              key: Key(task.id.toString()), // Key for the dismissible widget
              onDismissed: (direction) {
                // Optionally delete the task after swipe
                TaskDb().deleteTask(task.id!);
                setState(() {
                  _tasks.removeAt(index); // Update task list after deletion
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task deleted')));
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              direction: DismissDirection.endToStart, // Swipe from right to left to delete
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: Icon(
                    task.isCompleted
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: task.isCompleted ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    _toggleTaskCompletion(task.id!, task.isCompleted);
                  },
                ),
                onTap: () {
                  // Navigate to a detailed view of the task (if needed)
                },
              ),
            );
          },
        ),
          ),
        ],
      ),     
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateTask,
        child: Icon(Icons.add),
        tooltip: 'Create Task',
      ),
    );
  }
}

