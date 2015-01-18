//########################################################
//# Script Name  : download.sqs
//# Description  : Displays message to player after initiating the "Download Data" action on the laptop in
//#                the plane. It then waits 5 mins before setting the Laptop flag to 1 and displaying
//#                a message to the player to return to base.
//# Date Create  : 23.07.2010
//# Author       : Tigershark
//# Calls to     : None
//# Called from  : "Download Data" action on the laptop object. Defined in the init field of the laptop.
//# Amended      | Date:      | By:          | Reason:
//#
//########################################################

// Display a message to the player that action is acknowledged.
hint "Initiating download sequence...estimated time to completion is 5 mins.";

// _Computer = _this select 0
// _id = _this select 2
// _Computer removeaction _id

// Create a dealy of 5 minutes (60sec x 5) before executing the next command in the script.
sleep 300;

// Set the global flag variable to indicate the data has been downloaded.
varLaptop=1;

// Display a message to the player that the download is complete and they should return to base.
hint "Data transfer complete. Return to base.";
