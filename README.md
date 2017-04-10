## 3D Printable Modular Vertical Grow Tower (G-Tower)

I saw on YouTube a guy by the name of Larry Athey that created 3D printable stackable pieces for a DIY grow tower. He calls this system the G-Tower. His YouTube Channel is https://www.youtube.com/channel/UC17cRT7p8Eh_ytdGd_wG37A. Unfortunately, he wants $100 USD for the STL files! I figured it couldn't be too hard to reproduce, so I got to work. This repo is the result.

Here's OpenScad code (that I consider a mess) for several parts for making a 3D printable modular vertical grow tower. The parts are all available in 3" and 4" diameters. The code is fairly well documented. There's a few variables you can change at the top of the code, then just uncomment the function for the part you want to make. These parts are meant to be used with a 2" netpot.

The piece with the netpot can be printed in 3" height, but the angle for the netpot needs to be changed to 60 degrees. With the 4" height, the angle should stay at 45 degrees. If using the 3" height configuration, you are probably best sticking with herbs for those pieces. While 3x3", 3"x4", 4"x3", and 4"x4" are all possible, I'd really recommend the 3"x4" configuration (which is default in the code).

A 3" Schedule 40 configuration is also available, if needed. 3" Schedule 40 has an O.D. of 3.5", as documented in the code. Wall thickness on 3" Schedule 40 is 0.216", which is 5.4864mm. I use the 4mm wall thickness by default, but the larger wall thickness is probably a good idea.

End Caps are available without any holes, with a single hole in the middle (for 1/4" poly drip tubing), with 2 holes located closer to the outside (for parachute chord for hanging), or with all 3 holes.

An end cap insert is available to snap into the cap to divert water flow toward the sides of the tower, rather than drop straight through. If using the insert, snap it in place with the open side (the top) pointing in to the end cap. The insert should stick out a little bit to allow the water to flow.

Spacers are available in 2", 3", and 4" heights, either with holes on the side (for parachute chord for mounting) or without. 

### Printing Instructions
Unfortunately my printer is broken right now, so I haven't been able to print these and verify everything myself. I'd recommend a 0.2mm layer height and 30% infill, which is my standard for just about anything. I'd recommend using ABS, PET-G, or nylon for filament. PLA will degrade pretty quick when exposed to water and UV. If you're worried about not using "food grade" plastic, I really wouldn't worry. Netpots aren't made of that as far as I am aware, and the temperature of these towers should never get high enough for the plastic to off-gas. 

### Assembly Instructions
After printing, you may want to "seal" the outside of the pieces by painting them with an ABS slurry or some other kind of sealant. An acetone bath is optional, but not required. 

To assemble, run some parachute chord through the outer 2 holes on an end cap, or through the sides of a spacer, up through the inside of the tower, stacking spacers or netpot parts as you wish, and out through the outer holes of a top endcap. Tie the ends together and hang the tower. The netpot parts can be rotated any way you wish to allow more plants per tower. Popular tower heights are 3', 4', and 5' (roughly 0.9m, 1.2, and 1.5m).
Videos showing Larry's process are available here:
1) https://www.youtube.com/watch?v=_ovaBtXK4IM
2) https://www.youtube.com/watch?v=w4-ZIVMNXfE
3) https://www.youtube.com/watch?v=UwQM7J-pQes&t=965s

### Future Plans
I don't currently really have any future plans, but it would be nice to turn this repository into a holding place for anything 3D printable related to hydroponics, aquaponics, or any kind of ponic. :)

### License
Because I'd like this to be the ultimate repository for 3D Printable Hydroponic/Aquaponic parts, everything in this repo is goverened under the GNU Affero GPL v3. You are of course free to print the resulting parts to sell or give away as you see fit.

### TL;DR
Sorry, no tl;dr. There's too much good info that you should read.