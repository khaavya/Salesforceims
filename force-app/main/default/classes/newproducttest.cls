@istest
public class newproducttest {

    static testMethod void testMethod1()//Testing the insertion method
    {
        Productc__c testproduct = new Productc__c();
        testproduct.Name='test product';
        testproduct.Cost_Price__c=20;
        testproduct.Expiry_Date__c= System.today() + 30;
        testproduct.MRP__c= 25;
        testproduct.Quantity_In__c= 500;
        ApexPages.StandardController sc = new ApexPages.StandardController(testproduct);
        newproductextension npe = new newproductextension(sc);//Instantiate the Class
        
        npe.saveme();//Call the Method
        
        list<Productc__c> pro = [select id from Productc__c];//Retrive the record
        integer i =pro.size();
        system.assertEquals(1,i);//Test that the record is inserted
        
    }    
static testmethod void Testforcatch() {
       Productc__c testproduct1 = new Productc__c();
 		testproduct1.Name='test product';
	  testproduct1.MRP__c= 25;
      testproduct1.Cost_Price__c=20;
        testproduct1.Quantity_In__c=null;
        testproduct1.Expiry_Date__c= system.today()+2;
 		test.startTest();
         ApexPages.StandardController sc = new ApexPages.StandardController(testproduct1);
        newproductextension npe = new newproductextension(sc);//Instantiate the Class
            npe.saveme(); //Call the Method
  
       list<Productc__c> pro = [select id from Productc__c]; //Retrive the record
       integer i =pro.size();
        system.assertEquals(0,i);//Test that the record is inserted  
   test.stopTest();
    }
 
    static testMethod void testhome() 
    {
        Productc__c testproduct = new Productc__c();
        Test.StartTest(); 
        
        PageReference pageRef = Page.inventoryvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(testproduct);
        newproductextension npe = new newproductextension(sc);//Instantiate the Class
        npe.back();	
        Test.StopTest();
    }
    
}