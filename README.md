
# Bitcoin.com Challenge

BCWeather is a sample application to showcase how to simply connect to an external API 
and consume its data.  Although this surely could be improved upon, I definitely  hope this project is satisfactory as blending my mobile & crypto passions, all of that remotely, sounds pretty much like the dream job.


# External libs

for extensibility's sake I didn't want to use tons of external libs... I stuck to the basic ones. 

AlamofireObjectMapper : Networking lib to help with mapping JSON data to custom Objects.
AlamofireImage : Networking lib that deals with web image retrieval. 
lottie-ios : Library to use AfterEffects json exports to play slick animations on iOS.  Great for splash screens.
Swinject : Dependency Injection Framework.
SwiftLint : coding standards are good!

# Decisions

- Although in a team setting I'm a strong proponent of not using the .xib and .storyboard files (mainly to favor a strong code review process and to a lesser extent to avoid conflicts) when I do solo coding, even more so when time is an issue, I make use of them.  In real life situation, in a team, I'd use a lib like SnapKit or something, and go full on code, no storyboards nor xibs.

# Because of time constraints

- most assets are one size only... working with a designer we really should have got either a vectorial .pdf file or 3 sizes of .png files per asset
- I am not showing HUDs while executing requests against the server.  Most of the foundations for that are in place but I did not want to add an extra external dependency at this point.
- I left out the error handling,  in real world scenario it should be implemented.
- code coverage is in the 50%, would love to see it above 80% in real life applications 
- no Localization. In most production apps I have worked on, localization was a must.  For this sample I went with english only.
- UITest would have been nice.

