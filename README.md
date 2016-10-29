# Practice

An app that can fetch data from http://www.bbc.co.uk/radio1/playlist.json remote server. The URL is configurable in info.plist file. (For now, only support this URL with specific JSON data format and I only parsed a part of the data). And it will parse the data and display them in the collection view. The size of the views is different according to the device screen size. All layouts are handled programmatically. If any error happened during fetching the data, an alert dialog with retry and cancel options will pop up.

The user can tap any of the cells to navigate to the details. The navigation action is handled programmatically, in order to easily add more detail screen options in the future.

Used the Gloss for parsing the JSON and alamofire for request and fetching and caching the images. 
