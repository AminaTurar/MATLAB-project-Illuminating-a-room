# MATLAB-project-Illuminating-a-room
Illuminating a Room
 
Suppose we need to decide where to put light fixtures on the ceiling of a room measuring 10 meters by 4 meters by 3 meters high in order to illuminate it best. For aesthetic reasons, we are asked to use a small number of incandescent bulbs. We want the bulbs to a total maximum of 300 watts. For a given number of bulbs, how should they be placed to maximize the intensity of the light in the darkest part of the room? We also would like to see how much improvement there is in going from one 300-watt bulb to two 150-watt bulbs to three 100-watt bulbs, and so on.To keep things simple, we assume there is no furniture in the room and that the light reflected from the walls is insignificant compared with the direct light from the bulbs.
 
One 300 Watt Light Bulb
 
If there is only one light bulb, then we want to put the bulb in the center in the center of the ceiling. Let’s picture how well the floor is illuminated. We introduce coordinates x running from 0 to 10 in the long direction of the room, and y running from 0 to 4 in the short direction. The intensity at a given point, measured in watts per squaremeter, is the power of the bulb, 300, divided by 4 times the square of the distance of the bulb. Since the bulb is 3 meters above the point (5, 2) on the floor, at a point (x, y) on the floor, we can express the intensity as follows:
 
>> 
 We can use ezcontourf to plot this expression over the entire floor. We use the option colormap to arrange for a color gradation that helps us to see the illumination. See the online help for more colormap options.
 
>>
 
 
 
 
The darkest parts of the floor are the corners. Let us find the intensity of the light at the corners and at the center of the room.
 
>>
 
 
 
