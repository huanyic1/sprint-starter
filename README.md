# sprint-starter
Purpose: As a high school sprinter, I was tired of needing two other people just to time one of my 100 or 200 meters. Traditional timers either start immediately, which prevents sprinters from utilizing a 4 point stance, or countdown from 3, which gives an unfair advantage in timing as sprinters will be able to anticipate the start. This WatchOS app seeks to solve this problem. 

Considerations: 
1) Made the stop button the entire screen. Thus, when running, users can tap anywhere to stop. Reduces the chances of missing the button as crossing the finishline. 
Challenge: in order to accomplish this, needed to have "ignore safe area" and have max frame be infinity. Weird side effect was that the text area and button area were different shapes and occupied different spaces. Found out later that apple by default tints the button differently, so despite both the button and text having the same background color of black, the button background showed up gray. Embarrassingly pent 2+ hours trying to correct this issue

2) Changed the sound settings such that sound will play even with ringer off
Challenge: Sound too quiet on watch. Noticed built in sounds louder --> speakers can output more. Doubled loudness in audio editing software. 
Additionally, had to figure out how much to delay between pressing button and starting timer because have to account for playing the sound. 
--> Tried to adjust by having sound play at exactly 3 second mark of mp3 file. --> discovered further there is delay b/c of time taken to change screens/execute instructions --> Recorded video in slow motion to calculate exact delay before meticulously trimming audio file to match. This is because the sleep function will only take integers. 

3) FUTURE: Try to have timer stop when screen turns off. --> User can just slam screen. (Not possible at moment b/c WatchOS doesn't support keeping device screen locked in on.) 

4) FUTURE: Pair with phone app recording time, date ran, and distance. Maybe group by distance??
