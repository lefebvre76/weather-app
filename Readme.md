# Test Technique Weather

iOS application to weather in differents french cities

## Quickstart

[CocoaPods](https://cocoapods.org/) is required to install dependences
Install dependencies : 
```
pod install
```
and execute `weather.xcworkspace`

## API

Application use [openweathermap](https://openweathermap.org/) service to load datas.
You must set your `WEATHER_API_KEY` in environment variables (Edit Scheme > Arguments) with your own API Token

## Dependances
- [Alamofire](https://github.com/Alamofire/Alamofire) : To manage HTTP calls
- [AlertToast](https://github.com/elai950/AlertToast) : To show elegant alert and toast