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
}