import 'package:device_calendar/device_calendar.dart';
import 'package:tumh/data/data.dart';

/// A helper class to interact with a calendar app.
class CalendarInteraction {
  DeviceCalendarPlugin deviceCalendarPlugin = DeviceCalendarPlugin();

  CalendarInteraction() {
    checkPermission();
  }

  void checkPermission() async {
    var permissionsGranted = await deviceCalendarPlugin.hasPermissions();

    if (permissionsGranted.isSuccess && !permissionsGranted.data) {
      permissionsGranted = await deviceCalendarPlugin.requestPermissions();
      if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
        return;
      }
    }
  }

  Future<List<EventDisplay>> getEvents(int offset) async {
    DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();

    final calendarsResult = await deviceCalendarPlugin.retrieveCalendars();
    List<Calendar> calendars = calendarsResult?.data;

    List<EventDisplay> events = new List<EventDisplay>();

    for (Calendar c in calendars) {
      final dateStart = DateTime.now().add(new Duration(days: offset));
      final dateEnd =
          new DateTime(dateStart.year, dateStart.month, dateStart.day + 1);

      var calendarEventsResult = await _deviceCalendarPlugin.retrieveEvents(
          c.id, RetrieveEventsParams(startDate: dateStart, endDate: dateEnd));

      List<Event> _calendarEvents = calendarEventsResult?.data;
      for (Event event in _calendarEvents) events.add(parseEvent(event));
    }

    return events;
  }

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
