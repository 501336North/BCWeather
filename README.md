
# Bitcoin.com Challenge

BCWeather is a sample application to showcase how to simply connect to an external API 
and consume its data.  Although this surely could be improved upon, I definitely hope this project is satisfactory as blending my mobile & crypto passions, all of that remotely, sounds pretty much like the dream job.

# Usage

- Just do the traditional pod install in the project's folder
- then open the .xcworkspace in XCode
- Clean Build folder just to be sure
- Build & Run [ideally on a real device to take advantage of Core Location and to see the weather for your current city.]

# External libs

for extensibility's sake, I didn't want to use tons of external libs... I stuck to the basic ones. 

- AlamofireObjectMapper : Networking lib to help with mapping JSON data to custom Objects.
- Swinject : Dependency Injection Framework.
- SwiftLint : coding standards are good!


# Decisions

- Although in a team setting I'm a strong proponent of not using the .xib and .storyboard files (mainly to favor a strong code review process and to a lesser extent to avoid conflicts) when I do solo coding, even more so when time is an issue, I make use of them.  In real life situation, in a team, I'd use a lib like SnapKit or something, and go full on code, no storyboards nor xibs.


# Please note

- Code coverage is only around 65%.  I usually shoot for it to be somewhere between 80 to 90% in production applications.
- No Localization. In most production apps I have worked on, localization was a must.  For this sample, I went with English only.


# OpenWeather API

- Note that there is an error in the values returned by the Open Weather API with regards to wind speeds.  If you request with the metric unit parameter you get lower values than with imperial unit parameter.  Mph being faster than Km/h, it should be the opposite.  I ended up just consuming the data as is.  
- The icon returned by OpenWeather are VERY SMALL and don't show up very good in the tableView.  Since it was part of the requirement files I went ahead and used them anyway but in a production app, I'd find a better icon service.
