@istest
public class inventoryexttest {
     static testMethod void testsearch() 
    {
           Productc__c testproduct = new Productc__c();
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
         ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.pname='';
        ext.code='';
        ext.search();
        ext.pname='test';
        ext.search();
        ext.pname='';
        ext.code='p';
        ext.search();
        ext.pname= 'test';
        ext.code='p';
        ext.search();
        Test.StopTest();
    }
    static testMethod void testsearchbrand() 
    {
           Productc__c testproduct = new Productc__c();
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
         ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.Brand='';
        ext.SearchBrand();
        ext.Brand='p';
        ext.SearchBrand();
        Test.StopTest();
    }
    static testmethod void testplaceorder() 
    {
        Productc__c testproduct = new Productc__c();
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
        
        PageReference pageRef = Page.placeordervf; // Add your VF page Name here
        pageRef.getParameters().put('tid', String.valueOf(testproduct.Id));
        pageRef.getParameters().put('tname', String.valueOf(testproduct.name));
        Test.setCurrentPage(pageRef);
        
        
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        
        ext.placeorder();	
        Test.StopTest();
    }
    static testMethod void testviewallpro(){
        Productc__c testproduct = new Productc__c();
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.viewallproducts();
        Test.StopTest();
    }
    static testMethod void testtransinfo(){
        Productc__c testproduct = new Productc__c();
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.transinfo();
        Test.StopTest();
    }
    static testMethod void testproinfo(){
        Productc__c testproduct = new Productc__c();
            testproduct.Name='test product';
            testproduct.Cost_Price__c=20;
     
            testproduct.Expiry_Date__c= System.today() + 30;
            testproduct.MRP__c= 25;
            testproduct.Quantity_In__c= 500;
            insert testproduct;
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.productid=testproduct.Id;
        ext.productinfo();
        Test.StopTest();
    } 
    static testMethod void testproinfo1(){
        Productc__c testproduct = new Productc__c();
            testproduct.Name='test product';
            testproduct.Cost_Price__c=20;
   
            testproduct.Expiry_Date__c= System.today() + 30;
            testproduct.MRP__c= 25;
            testproduct.Quantity_In__c= 500;
            insert testproduct;
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.productid=testproduct.Id;
        ext.productinfo1();
        Test.StopTest();
    }
    static testMethod void testnewp() 
    {
        Productc__c testproduct = new Productc__c();
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
        PageReference pageRef = Page.newproductvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.newproduct();
        Test.StopTest();
    }
    static testMethod void testhome() 
    {
        Productc__c testproduct = new Productc__c();
        list<Productc__c> testlst =new list<Productc__c>();
        Test.StartTest(); 
        PageReference pageRef = Page.imsvfp; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.home();
        Test.StopTest();
    }

       static testmethod void testpick(){
          list<Productc__c> testlst =new list<Productc__c>();
           Category__c ct= new Category__c();
        ct.Name='Animal';
        insert ct;
        Sub_Category__c st=new Sub_Category__c();
        st.Name='cat';
        st.Category__c=ct.Id;
        insert st;
          Productc__c testproduct = new Productc__c();
            testproduct.Name='test product';
            testproduct.Cost_Price__c=20;
        	testproduct.Sub_Category__c=st.Id;
            testproduct.Expiry_Date__c= System.today() + 30;
            testproduct.MRP__c= 25;
            testproduct.Quantity_In__c= 500;
            insert testproduct;
         Test.StartTest(); 
         ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
           
        ext.selsub=st.Name;
        ext.pick();
        test.stopTest();
		}
    static testmethod void testgetcatnames(){
          list<Productc__c> testlst =new list<Productc__c>();
	 Category__c ct= new Category__c();
        ct.Name='Animal';
        insert ct;
            Test.StartTest(); 
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
        ext.getCatnames();
        test.stopTest();
    }
     static testmethod void testgetSubnames(){
           list<Productc__c> testlst =new list<Productc__c>();
	 Category__c ct= new Category__c();
        ct.Name='Animal';
        insert ct;
           Sub_Category__c st=new Sub_Category__c();
        st.Name='cat';
        st.Category__c=ct.Id;
        insert st;
            Test.StartTest(); 
      ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(testlst);
        inventoryvfextension ext = new inventoryvfextension(stdSetController);
         ext.selcat1='Animal';
         ext.getSubnames();
        test.stopTest();
    }

    
}