@istest
public class imsapextest {
    static testMethod void testsearch() 
    {
        Test.StartTest(); 
        imsapex ext = new imsapex();
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
        Test.StartTest(); 
        imsapex ext = new imsapex();
        ext.Brand='';
        ext.SearchBrand();
        ext.Brand='p';
        ext.SearchBrand();
        Test.StopTest();
    }
    static testMethod void testproducts() 
    {
        Test.StartTest(); 
        imsapex ext = new imsapex();
        ext.products();
        Test.StopTest();
    }
    static testMethod void teststore() 
    {
        Test.StartTest(); 
        PageReference pageRef = Page.inventoryvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        
        imsapex ext = new imsapex();
        ext.store();
        Test.StopTest();
    }
    static testMethod void testimsm() 
    {
        Test.StartTest(); 
        PageReference pageRef = Page.inventoryvf; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
        
        imsapex ext = new imsapex();
        ext.imsm();
        Test.StopTest();
    }
    static testmethod void testpick(){
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
        imsapex ext = new imsapex();
        ext.selsub=st.Name;
        ext.pick1();
        test.stopTest();
		}
    static testmethod void testgetcatnames(){
	 Category__c ct= new Category__c();
        ct.Name='Animal';
        insert ct;
            Test.StartTest(); 
        imsapex ext = new imsapex();
        ext.getCatnames();
        test.stopTest();
    }
     static testmethod void testgetSubnames(){
	 Category__c ct= new Category__c();
        ct.Name='Animal';
        insert ct;
           Sub_Category__c st=new Sub_Category__c();
        st.Name='cat';
        st.Category__c=ct.Id;
        insert st;
            Test.StartTest(); 
        imsapex ext = new imsapex();
        ext.selcat1='Animal';
         ext.getSubnames();
        test.stopTest();
    }
}