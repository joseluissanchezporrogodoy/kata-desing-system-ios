# Design System Technical Test

This project involves developing a library that supports UIKit and SwiftUI user interface frameworks, focusing on a design system. The main challenge is to create a library of components and ensuring accessibility.

### **📖 Description**

The goal is to develop the following key component — **Alert** — based on the designs provided in [Figma](https://www.figma.com/file/K6wOCDyoNqSa8qMAuTXtAr/Starter-Design-System-(Community)?type=design&node-id=0-1&mode=design&t=hvZcPmpp5cXFApGy-0).

### **🚀 Getting Started**

Ensure you have the necessary environment set up. You will be provided with a workspace template that contains a package for the library and two showroom aplicationto to validate the result.

**Step 1:** Clone the Provided Repository
Start by cloning the repository provided by our team. This repository contains the basic setup for your development.

**Step 2:** Start Developing
Begin by developing the Button or Alert component based on the Figma designs. 

### **🛠 Technical Challenges**

**Challenge 1: Universal Components Development**
📌 Develop the Button and Alert.

For exampe:

**SwiftUI**:

```swift
// For create a button with text-only, you can use the initalizer that takes a title string.
DSAlert(
    title: "Title",
    // ...
)
```

**UIKit**:

```swift
// For create a button with text-only, you can use the initalizer that takes a title string.
UIDSAlert(
    title: "Title",
    // ...
)
```

**Challenge 2: Accessibility**
📌 Ensure that the Alert component are accessible to users with disabilities.

Follow best practices for accessibility, such as providing alternative text for images, using proper semantic markup, etc.

### **🌟 Extra Points**

- **Code Reusability:** Demonstrating high levels of code reuse between components and across platforms.

### **🌟 Submission Guidelines**

- **Regular Commits:** Make regular commits to the repository to showcase the evolution of your project. Completing all tasks is not mandatory; progress in any form is valued.
- **Documentation:** Include a README with implementation instructions and component demonstrations.
- **Public Repository:** Once completed, make sure your repository is public and share the link with us.

### **🙌 Conclusion**

Good luck with the technical test! We are eager to see your approach to the challenges and the creative solutions you come up with. Feel free to ask for any clarifications or further information.
