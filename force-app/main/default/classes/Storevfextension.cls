public with sharing class Storevfextension {
    public list<account> brandlist{set;get;}
    public Productc__c pro{set;get;}
    public String productid{set;get;}
    public list<Productc__c> product{set;get;}
    
    public String pname{set;get;}
    public String code{set;get;}
    public String Brand{set;get;}
    public string q{set;get;}
    
    public boolean flag1{set;get;}
    public boolean flag2{set;get;}
    public boolean flag{set;get;}
    public boolean flagb{set;get;}
    
    private ApexPages.StandardSetController ctrl {get;set;}
    
    public Storevfextension(ApexPages.StandardSetController stdController){
        //flag1 for search
        flag1=false;
        flag2=false;
        flag=true;
        flagb=false;
        ctrl=stdController;
        this.pro = (Productc__c)stdController.getRecord();     
    }
    public void search(){
        //to get fields on search 
        q='select name,Code_Barcode__c,Brand__c,Product_SKU__c,MRP__c,Quantity_In__c,Quantity_In_Store__c,Quantity_Out__c,Availability__c from Productc__c ';
        
        if((pname=='')&&( code=='')){
            
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Enter atleast one field to filter'));
        }
        else
        {
            if((pname!=null && pname!='')&&(code!=null && code!=''))
            {
                q = q+' where name like \'%'+pname+'%\'and Code_Barcode__c like \'%'+code+'%\'';
            }else
            {
                if(pname!=null&&pname!='')
                {
                    q = q+ ' where name like \'%'+pname+'%\'';
                }
                else{
                    if(code!=null&&code!='')
                    {
                        q = q+' where Code_Barcode__c like \'%'+code+'%\'';
                    }
                } 
            }
            product = database.query(q);
            flag1=true;
            flag2=false;
        }   
    }
    public void SearchBrand(){
        flag=false;
        flagb=true;
        brandlist=[select name,(select name,Code_Barcode__c,MRP__c,Brand__c,Product_SKU__c from Products__r) from account where name like:brand];
    }
    public pagereference home(){
        
        PageReference pr = new PageReference('/apex/imsvfp'); 
        pr.setRedirect(true);
        return pr;
    }
    public void productinfo(){
        flag1=true;
        flag2=true;
        product=[select name,Code_Barcode__c,Brand__c,Product_SKU__c,MRP__c,Amount_of_Measuring_Type__c,Measuring_Type__c,Quantity_In__c,Quantity_In_Store__c,Quantity_Out__c,Availability__c from Productc__c where id=:productid];
        system.debug(product);
    }
    public void viewallproducts(){
        flag1=false;
        flag2=false;
        flag=true;
        flagb=false;
        brand=null;
        pname=null;
        code=null;
        brandlist=null;
        product=[select name,Code_Barcode__c,Brand__c,Product_SKU__c,MRP__c from Productc__c];
    }
}