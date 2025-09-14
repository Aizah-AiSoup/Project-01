/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR time = -1
VAR exposure = -1
VAR anti = 0
-> opening

==opening==
It is currently {go_time() }
The president has called you for an important meeting. "Good afternoon soilder, you are the best we have" "There was an outbreak in the lab and was people affected by the Aizahvirus, they have all become zombies... We need you to go and clear out the contaminated before it spreads to the rest of the world! What will you do?
* [Go to the lab] ->lab_ending
* [You refuse] -> bradpitt_ending

== lab_ending ==
Current exposure levels: {expo() }
It is {go_time() }
You grip your flashlight and pistol tightly. Every noise puts you on edge. You need to find all the contaminated! You aren't sure how many there are, however you can esitimaete there are atleast 30 by the workers in the lab. Your map shows you are coming across a room on the side. Do you continue down the corridor to the main room?
* [Hallway] -> hall
* [Go into the room ] -> room
-> END

== hall ==
Current exposure levels: {expo() }
It is {go_time() }
You continue down the hallway-the stench of sick infects your nose. Your pistol at the ready. You come across another room, do you stay on this path or see this one?
* [Go into the room] -> room2
* [Stay in the hallway] -> hall2

== room2 ==
~ anti = anti + 1
Current exposure levels: {expo() }
It is {go_time() }
You find an antidote!

* [Go back] -> hall2
-> END
== hall2 ==
Current exposure levels: {expo() }
It is {go_time() }
The hallway splits up into two which do you take?
*[Left] -> left_hall
*[Right] -> right_hall

==left_hall==
Current exposure levels: {expo() }
It is {go_time() }
There is nothing here, you just spent more time in here that you cant afford to spend!
* [Go Back] -> right_hall

==right_hall==
You find the zombies! They are all crowding this diffuser machine.
*[Attack!] -> fight
*{anti > 0} [Use the antidote with the machine] -> win
== room ==
Current exposure levels: {expo() }
It is {go_time() }
There is nothing here, you just spent more time in here that you cant afford to spend!
* [Go Back] -> hall
==win==
yay you win!
->END
==fight==
you lose! there are just too many!
-> END
== bradpitt_ending ==
It is {go_time() }
You warn your friends and family to get to a sade spcae, there is an outbreak coming! You ony have a cat however you get in your jeep and go find a bunker!
* [Find the bunker] -> bunker
== bunker ==
You warn everyone that there is something coming. You are able to save some people however some don't belive you . You all are able to survive for long enough and all the infected die out entually. You are alive are met with a dystopian society.
-> END
== function go_time ==
~ time = time +1

{
    -time > 2:
        ~time = 0
}
{
    -time == 0:
        ~return "morning"
    -time == 1:
        ~return "afternoon"
    -time == 2:
        ~return "evening"
}
    ~ return time

== function expo ==
~ exposure = exposure +1

{
    -exposure > 7:
        ~return "your too far gone..."
}
{
    -exposure == 0:
        ~return "nothing"
    -exposure == 1:
        ~return "low"
    -exposure == 2:
        ~return "medium"
    -exposure == 3:
        ~return "medium high"
    -exposure == 4:
        ~return "high"
    -exposure == 5:
        ~return "infected stage one!"
    -exposure == 6:
        ~return "almost fully infected! In the next choice, you will loose!"
}
    ~ return exposure

