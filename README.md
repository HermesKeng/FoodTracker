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
- How do we implement **Rating Control** in this example ?
   
   Stackview -> RatingControlClass -> Set up Button -> Design button programmingly -> use **"Add Target"** to add click event
- There are five different states in UIButton, we can set different image with different state
    1. normal
    2. highlighted
    3. focused
    4. selected
    5. disabled
    
    We are going to choose the image for different states and change the image by **rattingButtonTapped**


     
