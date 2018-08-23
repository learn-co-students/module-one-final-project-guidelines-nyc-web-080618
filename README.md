         EventChecker Explanation

Welcome to EventChecker! This is our amazing searching engine for events held by different artists or in different cities. Users can definitely find their favorable events and save the events by using EventChecker.

We have 3 many-to-many relationships in our model.

1. We have many Artists, and many Cities. The joint table of Artist class and Ciry class is Event class. In each event, we can track which artist will hold this event and the location of the event.

2. As we have many Events and many GuestStar, the joint table of these two classes is Invitation class.

3. The Last many-to-many relationship is formed by Event, User, and UserEvent. UserEvent will be the joint table. Users can save the events they are going to attend.

![Alt picture](picture.png?raw=true "Title")


Each class stores different information. Users can easily find out information they need, such as

· When and where the event will be held.

· If their favorable artist is going to have an event.

· The event with lowest ticket price in the city they live.

· What guest star is invited by their favorable Artist in a particular event.

· If their favorable guest star is going to attend the event hold in the city the user live in.


We hope every user enjoy our EventChecker.
