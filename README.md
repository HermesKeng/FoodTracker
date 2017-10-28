# FoodTracker
> This practice is for my IOS learning Process
> ReferencePage : [Apple Tutorial Guide](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html#//apple_ref/doc/uid/TP40015214-CH2-SW1)

![Default Interface](https://github.com/HermesKeng/FoodTracker/blob/master/images/default.png)

- This practice is about using textfiled, selecting photo in photo library, setting up the gesture to tap, and building our own custom control

- Textfield
  1. accept user input from text field, we need some help from a text field delegate
  2. text field keeps a reference to other object the delegate

- UITextfieldDelegate
  1. A set of optional method that you use to manage **editing and validation** of text in a text field object
  2. There are three main topic in using textfieldDelegate 
      - validate text that was typed by user 
      - respond to specific interactions with the key board 
      - control the overall editing process
- Delegate
  1. Any object can serve as a delegate for another object as long as it conforms to the appropriate protocal
  
- Nuanced difference between views and controls
  - Views : Display content ex: Label, ImageView
  - Control : Modify the content in some way ex: text field, button
  
- ImageView is a view, so we can't use it to create a action method to access the photo library
    - How do we crate a action ? Use **GestureRecognizer** 
    - How do we access photo in photo library ? Use **UIImagePickerController and UIImagePickerControllerDelegate**
      - There are two methods to implement to select and cancel the image in photo library
          1. imagePickerControllerDidCancel
          2. imagePickerController
          
- Custom View:
    1. init(frame:): initial the view 
    2. init(coder:): loading the view from the storyboard
    3. Add Support for Interface Builder
        - @IBDesignable : It can preview our custom view in mainstory board
        - @IBInspectable : Let us inspect our attribute in attribute inspector. However, it cannot be changed by attribute inspecter
        
        - Add property observer observes and responds to changes in property value by using **Didset** method
---
- How do we implement **Rating Control** in this example ?
   
   Stackview -> RatingControlClass -> Set up Button -> Design button programmingly -> use **"Add Target"** to add click event
- There are five different states in UIButton, we can set different image with different state
    1. normal
    2. highlighted
    3. focused
    4. selected
    5. disabled
    
    We are going to choose the image for different states and change the image by **rattingButtonTapped**

- Next, We are going to make a class to store the meal cell.
    - There are three variable in Meal Class,name, photo,and rating.
    - When you make a class, it must have a init method to initialize it. Therefore, we use **init?** method to initialize it.
    - In this method, **?** is used to return optional value to check if the option has a value.
    
- Guard statement : If it meet the condition, the code is going to run successfully. Otherwise, if the condition doesn't meet, the statement is going to else part to show the error message. 

- Creating Another View : We need another view to display the meal list, setting up it to the initial view
  1. UITableView designed specifically to display a scrolling list of items
  2. UITableView Controller is designed to handle table-view relate logic 
    - Step to build up UITableView Controller
      1. Create the tablecell class to set up your custom cells
      2. link it and set the outlet to the tablecell
      3. Create controller to load the initial data model
  3. How do we display the data ?
      1. A data source
      2. A delegate: it helps the tableView manage cell selection, row heights, and other aspects related to displaying the data

      (The Controller implements both method)
      
- UITableViewController: 
  1. numberOfSections(in tableView: UITableView): To set up how many section in the cell
  2. tableView(_ tableView: UITableView, numberOfRowsInSection section: Int): How many row should be create 
  3. tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath): Configure and provide a cell to be display for a given row
  4. dequeueReusableCell: The table tries to reuse the cells by this method
---
- Segue: We use segue to make one view transition to another.
- Navigation Controller: We are going to put our TableViewController into navigation controller
  - It manages transitions forward and backward between different view controllers.
  - The set of view controllers managed by a particular navigation controller is called its navigation stack. (First one called root view controller)
![Navigation Bar & Table View Introduction](https://github.com/HermesKeng/FoodTracker/blob/master/images/Navbar_TableView.jpeg)
  
- What is navigation bar's name?
  1. Navigation bars get their title from the view controller at the top of navigation stack
  2. Each view controller has a navigationItem property
- Push navigation is designed for a drill down interface
- Unwind Segue: It provides a simple method for passing information to an earlier view controller.
  1. The Unwind Segue traverses your navigation hierarchy to locate the destination view controller
  2. The view controller that initiated the unwind segue is sent a prepare method, we can override it to pass data to destination
      - prepare(for:sender:) : A segue gets triggered, it provides a place for you to add your own code that gets executed.Therefore, you can write the code to store data or do any necessory cleanup here
  3. The destination unwind method is invoke
  4. The view transition about source & destination
  
- Nil Coakescing Operater (??): You are going to see ```let name = mealTextField.text ?? ""``` in prepare method
  - The nil coakescing operator is used t return the value of an optional if the optional has a value or return a default value otherwise
  - The operater unwraps the optional String returned by nameTextField.text. If the nameTextField.text is nil, the program is going to set up space string instead
---
- Now we are going to edit and delete the item in meal cell list
 - Edit the meal
   1. Pass the value what it tap
   2. Store value
   ![The step to implement edit cell in the meal list]

     
