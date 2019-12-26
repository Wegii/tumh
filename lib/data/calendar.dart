import 'package:device_calendar/device_calendar.dart';
import 'package:tumh/data/data.dart';

/// A helper class to interact with a calendar app.
class CalendarInteraction {
  /// Object to interact with a calendar app
  final DeviceCalendarPlugin deviceCalendarPlugin = DeviceCalendarPlugin();

  CalendarInteraction() {
    checkPermission();
  }

  /// Check if access to the calendar is granted, otherwise request permission.
  void checkPermission() async {
    var permissionsGranted = await deviceCalendarPlugin.hasPermissions();

    if (permissionsGranted.isSuccess && !permissionsGranted.data) {
      permissionsGranted = await deviceCalendarPlugin.requestPermissions();
      if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
        return;
      }
    }
  }

  /// Get a list of events.
  ///
  /// Create a list of all events on the current day. The information contained
  /// by each event will be parsed and wrapped in a custom object to allow
  /// easier access.
  /// [offset] allows to query events for later days.
  ///
  /// Returns a list of events.
  Future<List<EventDisplay>> getEvents(int offset) async {
    // Retrieve all available calendars on the device.
    final calendarsResult = await deviceCalendarPlugin.retrieveCalendars();
    List<Calendar> calendars = calendarsResult?.data;

    List<EventDisplay> events = new List<EventDisplay>();

    // Iterate over all calendars an add all events to a list.
    for (Calendar c in calendars) {
      final dateStart = DateTime.now().add(new Duration(days: offset));
      final dateEnd =
          new DateTime(dateStart.year, dateStart.month, dateStart.day + 1);

      var calendarEventsResult = await deviceCalendarPlugin.retrieveEvents(
          c.id, RetrieveEventsParams(startDate: dateStart, endDate: dateEnd));

      List<Event> _calendarEvents = calendarEventsResult?.data;
      for (Event event in _calendarEvents) events.add(parseEvent(event));
    }

    return events;
  }

  /// Returns wrapper for the passed events.
  ///
  /// [event] specifies the event to parse.
  EventDisplay parseEvent(Event event) {
    String content = "";

    content = (event.description != "") ? event.description : event.location;

    return EventDisplay(
        title: event.title,
        content: content,
        start:
            event.start.hour.toString() + ":" + event.start.minute.toString());
  }
}
