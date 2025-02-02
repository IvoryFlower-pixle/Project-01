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
VAR friend_name = ""
VAR Lantern = 0
VAR Canteen = 0
VAR FilledLantern = 0
VAR time = -5 

-> Forest_entrance

== Forest_entrance ==
You stood at the entrance to a forest, looking down the path leading deeper inside. You never planned to come back to this place, but your old friend asked you to come back. One last time.
Ah, but it seems your having a little trouble remebering what your friend's name was. What was it again?

*[Olivia]
 ~ friend_name = "Olivia"
  -> Forest_entrance2
*[James]
 ~ friend_name = "James"
  -> Forest_entrance2
*[Alex]
 ~ friend_name = "Alex"
  -> Forest_entrance2
-> END  

== Forest_entrance2 ==
Ah yes, {friend_name}, that was it
{ friend_name == "Olivia": She was such a sweet gal, been you best friend ever since your young. You can only wish you had more time with her.|}
{ friend_name == "James": James was such a funny guy, could always manage to make you smile since you two were young. Why was it that he had to go so soon? |}
{ friend_name == "Alex": Alex was someone who always stood for what they believe in, it was something you always admidered about them. You missed them.|}
You should probably get a move on, before those memories become to much.

*[Walk into the forest] -> Forest_path


-> END

== Forest_path ==
{left_Path: Your back at the turn. |You go down the path, looking around as you walk, the forest was lit up by the afternoon sun making the place feel warm. You can't help but smile at all the warm memories it brings of {friend_name}. You two loved to play here after all. After walking for a while, you come across another path heading to the left. }

What do you do?
+ [Go down the left path] -> left_Path
+ [Keep heading strait ] -> Cave_entrance

-> END

== left_Path ==
{Bench+Pond: You stare out at the clearing. |You turn and head down the left path. You don't find anything interesting for a while until you come across a small clearing with a pond. You look around and notice there to be a stone bench with something on top of it.}

* [Investigate the Ponds edge] -> Pond
* [Investigate Stone Bench] -> Bench
* {Lantern*Canteen == 1} [Fill oil Lamp] -> Oil_Lamp
+ [Go back] -> Forest_path

-> END

== Oil_Lamp ==
~FilledLantern = FilledLantern + 1
You filled the Oil lamp with oil. Unfortunately, you don't think it will even last an hour with such little oil.
* [Go Back] -> left_Path

== Bench ==
 ~Lantern = Lantern + 1
Walking up to the bench you find a old oil lamp. You take it as you feel it may be of use to you.
{ friend_name == "Olivia": If you can remeber correctly, you two loved to play explorers with this old thing, looks like it needs a bit of oil though.|}
{ friend_name == "James": If you can remeber correctly, you two loved to tell scary stories with this old thing whenever you had sleepovers, looks like it needs a bit of oil though. |}
{ friend_name == "Alex": If you can remeber correctly, you two loved to sit outside at night with this old thing, you would spend hours looking at the stars, looks like it needs a bit of oil though.|}

{Pond: |Maybe you should go check out the pond, don't know what you can find there.}

* [ Go back] -> left_Path

-> END

== Pond ==
~Canteen = Canteen + 1
You walk up to the pond and watch the fishes swim around for a moment. Then you notice something somewhat burried in the dirt. Digging it out, you find a small canteen filled with oil. Hmmm, this could be useful. 
{Bench: |Perhaps you could use it with that item on the bench.}

* [Go back] -> left_Path


== Cave_entrance ==
You keep walking strait and find an entrance to a cave. You knew this was where you needed to be but with how dark the cave was, you needed a light if you wanted to move forward. 

* {FilledLantern > 0} [Light the Oil Lamp] -> Lit_Cave_Entrance
+ [Go back] -> Forest_path

-> END

== Lit_Cave_Entrance == 
With the path now lit, you could make your way inside. You note that you only have about 40 minutes to find what your looking for before you had to make your way back or risk the lamp going out.

You have {advance_time() } minutes left

+ [Enter the cave] -> Crossroad

-> END

== Crossroad ==
{Left_Tunnel+Right_Tunnel: Your back at the crossroad. |Walking into the cave, you appreciate the sudden coolness as the heat was starting to bother you. You walk for a few minutes untill you come across two paths to take. One to the left and one to the right. You should be careful in which path you choose.}

You have {advance_time() } Minutes left

{ time == 40: -> Bad_Ending }

* { time == 40} [Select this option once time hits 0] -> Bad_Ending
+ [Go left] -> Left_Tunnel
+ [Go right] -> Right_Tunnel


->END

== Left_Tunnel ==
{Lost_time: You wasted your time coming here, you should head back. |You walk down the left tunnel for some time and come across a small room. Should you investigate?}
You have {advance_time() } Minutes left

{ time > 40: -> Bad_Ending }

* { time == 40} [Select this option once time hits 0] -> Bad_Ending
* [Investigate] -> Lost_time
+ [Go Back] -> Crossroad


-> END

== Lost_time ==
You find nothing, looks like this was just a waste of time.
* [Go back] -> Left_Tunnel

-> END

== Right_Tunnel ==
{crack+Corner+Floor+Ceiling:You stand at the entrance to the room, what do you do? |You go down the right tunnel and come across a big room with lots of things to investigate. What do you do?}

You have {advance_time() } Minutes left

{ time > 40: -> Bad_Ending } 

* { time == 40} [Select this option once time hits 0] -> Bad_Ending
* [Investigate crack in the wall] -> crack
* [Investigate pile of rubble] -> rubble
* [Investigate the corners of the room] -> Corner
* [Investigate hole in the floor] -> Floor
* [Investigate the ceiling] -> Ceiling
+ [Go Back] -> Crossroad


-> END

== crack ==
You look at the crack in the wall but find nothing. You don't really think you could fit anything in it anyway.
* [Go back] -> Right_Tunnel

-> END

== rubble ==
You dig throught the pile of rubble and eventually you find an old toy. 
{ friend_name == "Olivia": A small stuffed rabbit.|}
{ friend_name == "James": A small stuffed dinosaur.|}
{ friend_name == "Alex": A small stuffed bear.|}
* [Grab toy] -> Good_Ending

-> END

== Corner ==
Sadly you find nothing in the corner.
* [Go back] -> Right_Tunnel

-> END

== Floor ==
You wounder what could of caused there to be a hole in the floor, but soon lose intrest when finding nothing inside.
* [Go back] -> Right_Tunnel

-> END

== Ceiling ==
I don't know why your looking at the ceiling, theres nothing there.

* [Go back] -> Right_Tunnel

-> END

== Good_Ending ==
Grabing the toy, and looking at it. You find yourself recognizing it as a long lost toy of {friend_name}. A toy they had said they had lost when exploring as a child. Sadly they had passed away a few months ago so you coulden't return it to them. But perhaps you could keep it in memory of them.

-> END

  == Bad_Ending ==
    You ran out of time and now you need to make your way back before the light goes out. To bad you couldn't find anything interesting here though.
    -> END

== function advance_time ==

    ~ time = time + 5
    
    {
        - time > 40:
             
    }    
    
    {    
      - time == 0:
            ~ return "40"
        
        - time == 5:
            ~ return "35"
        
        - time == 10:
            ~ return "30"
        
        - time == 15:
            ~ return "35"
        
          - time == 20:
            ~ return "20"
        
        - time == 25:
            ~ return "15"
        
        - time == 30:
            ~ return "10"
        
          - time == 35:
            ~ return "5"
        
        - time == 40:
            ~ return "0"
        
      
    }
    
    ~ return time
    