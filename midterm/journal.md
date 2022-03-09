# Midterm Project Progress 

## Project Proposal: 

Option 1:  A simulator

You are tasked with looking after a group of children, you have to please them by giving them rewards like stickers and chocolates when they stay out of trouble, and their admiration towards you levels up. If they get out of control, you have to get their attention and keep them out of trouble. Maybe each child can react differently, have different personalities etc.

Option 2: Birds

You're at the park birdwatching and feeding a group of the birds, observing how they fly and how they are attracted to you when you give them food. Some of them may come, eat a little of the food you dropped for them, then fly off before coming back for more. Some of the other birds may exhibit different behaviors, watch and see! Maybe the birds can fly through a flowfield?

## Process:

So I've chosen to go with the first option - and right now I'm working out the mechanics and everything for how this simulator should work. Some of my ideas:

### THE STORY: Your little sister Mei has invited her friend over to play with her in your home's backyard, but it is your job to babysit them and make sure they don't cause any chaos in the yard. 

The 3 kids are your sister Mei, and her friend Sam. Each one of them has a personality that you have to keep in mind, as they have specific things that please them and keep them listening to you. 

MEI : Shes very active, likes to run around the yard a lot, and she trips and falls sometimes. She likes stickers, so giving her some is going to cheer her up.  
SAM : He likes to jump around and cause chaos among the kids but he calms down when you offer him his some candy.
<!-- SCRAPPED FOR NOW :CHLOE : She gets loud sometimes.. but she's a major sweet tooth so she will listen to you and quiet down if you offer her candy.  
 -->
MECHANICS: I think I'm going to go with pressing keys, so 'S' for stickers, 'C' for candy. 

Each child has an adoration level towards you, starting with 0 and capping at 10. You gain points by pleasing them of course, and lose them by ignoring the kids for a specific amount of time. 

The kids will be moving around this yard background:
<img width="648" alt="bg" src="https://user-images.githubusercontent.com/90758596/156183603-4b7937fb-21f5-4366-baf6-b0217f6037e3.png">

I'm planning on it being first-person POV (the user's pov) and it should look something like this, with the kids in the yard and the keyboard instructions somewhere on the top half of the screen.

![sketch](https://user-images.githubusercontent.com/90758596/156185882-8afef574-fc12-4a4e-8521-35f28ea881e0.jpg)


## UPDATES:

I have decided to go with two kids rather than three, Mei and Sam, and have them both like candy instead of different things. The candy is on your mouse, and you click on the kids to give them candy. When you give them the candy, they behave for a few seconds, then go back to moving around. Mei moves around the yard while Sam jumps in one place. Their adoration levels are represented by a bar onscreen, and it inscreases when you click on the kids, then decreases when you ignore them for a set amount of time. Keypressed isnt being used anymore for actual gameplay, it is just used to change screens. I felt like using too many keys would be overcomplicated for the user, so I decided to use mousePressed. 
I also added some feedback when the kids adoration levels get to 10: their images change to having hearts above their heads, and when both children have adoration levels > 10, text appears onscreen indicating that they both like you now! Mission success! 



