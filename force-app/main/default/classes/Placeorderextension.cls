public class Placeorderextension {
    public Transaction__c transact{set;get;}
    public String transid{set;get;}
    public String tname{set;get;}
   
    private ApexPages.StandardController controller;
    Transaction__c request;
    public Placeorderextension(ApexPages.StandardController controller){
        this.controller = controller;  
        transid=apexpages.currentpage().getparameters().get('att');
        tname=apexpages.currentpage().getparameters().get('att1');
        System.debug('transid');
        this.transact = (Transaction__c)controller.getRecord();
    }
    public pagereference saveme()
    {
         try
        {
            transact.Product_C__c = transid;
            insert transact; 
		  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Transaction made Successfully!!'));  	
		}
        catch(Exception e)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getDmlMessage(0)));  
        }
        return null;
    }
    public PageReference home(){
        
        PageReference pr = new PageReference('/apex/inventoryvf'); 
        pr.setRedirect(true);
        return pr;
    }   
}