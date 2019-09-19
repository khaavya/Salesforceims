@istest
public class placeorderexttest {
    @isTest static void testMethodForException()//Checking Records for exception
    {
        Productc__c testproduct = new Productc__c();
            testproduct.Name='test product';
            testproduct.Cost_Price__c=20;
            testproduct.Expiry_Date__c= System.today() + 30;
            testproduct.MRP__c= 25;
            testproduct.Quantity_In__c= 500;
            insert testproduct;
            
        Transaction__c testtrans = new Transaction__c();
        testtrans.Order_Status__c='placed';
        testtrans.Order_Placed_Date__c=system.today();
        testtrans.Order_Receive_by__c=system.today()+8;
        testtrans.Product_C__c=testproduct.id;
        testtrans.Order_Shipped_To__c='store';
        testtrans.Quantity__c=100;
        testtrans.Transaction_Type__c='send';
        
          ApexPages.StandardController sc = new ApexPages.StandardController(testtrans);
         
        Placeorderextension poet = new Placeorderextension(sc); //Instantiate the Class
        try
        {
            poet.saveme(); //Call the Method
        }
        catch(Exception e)
        {}
        list<Transaction__c> trns = [select id from Transaction__c]; 
        system.debug('trns'+trns); //Retrive the record
        integer i =trns.size();
        system.assertEquals(1,i);//Test that the record is inserted        
        
    }
    @istest static void testMethod1() //Testing the insertion method
    {
         Productc__c testproduct = new Productc__c();
            testproduct.Name='test product';
            testproduct.Cost_Price__c=20;
            testproduct.Expiry_Date__c= System.today() + 30;
            testproduct.MRP__c= 25;
            testproduct.Quantity_In__c= 500;
            insert testproduct;
            
        Transaction__c testtrans = new Transaction__c();
        testtrans.Order_Status__c='placed';
        testtrans.Order_Placed_Date__c=system.today();
        testtrans.Order_Receive_by__c=system.today()+8;
        testtrans.Product_C__c=testproduct.Id;
        testtrans.Order_Shipped_To__c='store';
        testtrans.Quantity__c=100;
        testtrans.Transaction_Type__c='send';
        
           ApexPages.StandardController sc = new ApexPages.StandardController(testtrans);
         
        Placeorderextension poet = new Placeorderextension(sc); //Instantiate the Class
        try
        {
            poet.saveme(); //Call the Method
        }
        catch(Exception e)
        {}
        list<Transaction__c> trns = [select id from Transaction__c]; //Retrive the record
        integer i =trns.size();
        system.assertEquals(1,i);//Test that the record is inserted        
        
        
    }    
        @istest static void testforcatch() //Testing the insertion method
    {
         Productc__c testproduct = new Productc__c();
            testproduct.Name='test product';
            testproduct.Cost_Price__c=20;
            testproduct.Expiry_Date__c= System.today() + 30;
            testproduct.MRP__c= 25;
            testproduct.Quantity_In__c= 500;
            insert testproduct;
            
        Transaction__c testtrans = new Transaction__c();
        testtrans.Order_Status__c='placed';
        testtrans.Order_Placed_Date__c=system.today();
        testtrans.Order_Receive_by__c=system.today()+8;
        testtrans.Product_C__c=testproduct.Id;
        testtrans.Order_Shipped_To__c='';
        testtrans.Quantity__c=42;
        testtrans.Transaction_Type__c='';
        
           ApexPages.StandardController sc = new ApexPages.StandardController(testtrans);
         
        Placeorderextension poet = new Placeorderextension(sc); //Instantiate the Class
        try
        {
            poet.saveme(); //Call the Method
        }
        catch(Exception e)
        {}
        list<Transaction__c> trns = [select id from Transaction__c]; //Retrive the record
        integer i =trns.size();
        system.assertEquals(0,i);//Test that the record is inserted        
        
        
    } 
    @istest static void testhome() 
    {
        Transaction__c testtrans = new Transaction__c();
        Test.StartTest(); 
        PageReference pageRef = Page.inventoryvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
           ApexPages.StandardController sc = new ApexPages.StandardController(testtrans);
         
        Placeorderextension poet = new Placeorderextension(sc); //Instantiate the Class
        poet.home();
        Test.StopTest();
    }
    
}