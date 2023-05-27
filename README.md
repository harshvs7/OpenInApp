# OpenInApp
1. First step towards coding the screen was the architecture. I usually make separate files for models, extension, api calls, and constants etc, but this being a small project and for easy evaluation I cooperated some code in the viewController file itself.
2. I designed the screen on paper first analysing what constraints to be given to the view and what views to display and placed where.
3. I first opened a viewController, with scrollView of the size of the whole screen, and a containerView on top of it. the next was to put on all the labels and buttons.
4. For the graph i used Chart pod file and used static values but couldn't incorporate the api values.
5. For the the cells below the graph, I used collectionView giving it static size and putting the values from api to display in it in an array for easy scroll and auto-layouts.
6. View Analytics button was simple button
7. The Top Link and recent link button are centrally aligned, I haven’t added the functionality for the buttons just yet, a little time constraint, but that is a very easy task.
8. The TableView has dynamic values from the apis and can adjust the size accordingly.
9. For both tableView and collectionView, I created separate XIB files and cell files and assigned cell values in the code for cleaner code. 
10. For better toggle between Top Links and Recent Links I put them in the segment control, because the data was to be displayed in the same table view.
11. I also assigned and handled collectionView and tableView in extension function for the class.
12. The FAQs and Talk to us button is a filled button with colour opacity adjusted.
13. The Tab bar was a little tricky.
14. For the api calls, I first created a model according to need and response coming from the api.
15. I made api calls in the api manager file and then called that function in the viewController. I prefer this approach for cleaner code.
16. I used a model for the api data storage, some people use arrays and use jsonSerialization, but I find it confusing, so I used a model for the data storage.
17. For image display in from the api, I made an extension function for displaying the image on the screen, which I coming as a link from the api.
18. I also used a data formatter function, to format the date coming from the api to display it accordingly to the need.
