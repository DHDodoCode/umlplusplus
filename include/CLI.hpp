#pragma once
/*
  Filename   : CLI.hpp
  Description: File which generates the command line interface
  for the user to create UML diagrams
*/

//--------------------------------------------------------------------
// System includes
#include <string>
#include "UMLClass.hpp"
#include "UMLAttribute.hpp"
#include "UMLRelationship.hpp"
#include "UMLData.hpp"
#include "UMLFile.hpp"
#include "UMLMethod.hpp"
#include "UMLField.hpp"
#include "UMLParameter.hpp"
#include <vector>
#include <iostream>
#include <fstream>
//--------------------------------------------------------------------

//--------------------------------------------------------------------
// Using declarations
 using std::cin;
 using std::cout;
 using std::endl;
 using std::string;
 using std::vector;
 using std::invalid_argument;
//--------------------------------------------------------------------

class CLI
{
    private:
        // Stores choice input by user, representing position within diagram
        // When an invalid input is set, reverts to its previous position
        string userChoice;

        // Loop boolean that maintains CLI routine
        bool mainLoop;

        // Loop boolean that maintains CLI subroutines
        bool subLoop;

        // Error check to prevent 'success' print 
        bool errorStatus;

        // Main UML data object storing UML stuff
        UMLData data;

        // Displays fields and methods of a class to command line
        void listAttributes(UMLClass& umlclass); 

        // Display relationships of a class to command line
        void listRelationships(UMLClass& umlclass);

        // Displays classes in a numerical order and allows selection    
        string orderClasses(bool displayAttribute, bool displayRelationship);

        // Displays attributes in a numerical order and allows selection    
        std::shared_ptr<UMLAttribute> orderAttributes(UMLClass c);

        // Display relationships of a class to command line and allows selection
        string orderRelationships(UMLClass umlclass);

        // Displays the parameters of a method
        void listParameters(std::shared_ptr<UMLMethod> method);

        // Displays the parameters of a method with a corresponding number and allows selection based on the number
        UMLParameter orderParameters(std::shared_ptr<UMLMethod> method);
        
    public:
        // Displays command line interface
        void displayCLI();
        // Displays information about classes within the diagram.
        // Has conditional booleans to optionally display attributes and relationships.
        void displayDiagram (bool displayAttribute, bool displayRelationship);
        // Displays information about a single class with the name className.
        void displayClass (string className);
};