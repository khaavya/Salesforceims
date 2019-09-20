@istest
public class Storeexttest {
 @istest static void testhome() 
	 {
         Productc__c testproduct = new Productc__c();
		    list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
			PageReference pageRef = Page.imsvfp; // Add your VF page Name here
			Test.setCurrentPage(pageRef);
  ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
  Storevfextension ext = new Storevfextension(stdSetController);
         ext.home();
		Test.StopTest();
	 }
}