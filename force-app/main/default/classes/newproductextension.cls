public class newproductextension {
    private ApexPages.StandardController controller;
    public newproductextension(ApexPages.StandardController controller){
        
        this.controller = controller;  
        
    }
    
    public pagereference saveme()
    {
			 controller.save();
            string a=(string)controller.getId();
            if(a!=null){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Product Added Successfully!!')); 
            }
        
        return null;
    }
    public pagereference back(){
        
        PageReference pr = new PageReference('/apex/inventoryvf'); 
        pr.setRedirect(true);
        return pr;
    }
    
}