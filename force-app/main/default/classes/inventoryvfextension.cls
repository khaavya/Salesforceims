public with sharing class inventoryvfextension {
    public Productc__c pro{set;get;}
     public Productc__c product1{set;get;}
    public String productid{set;get;}
    public list<Productc__c> product{set;get;}
    public list<account> brandlist{set;get;}
    
    public list<Transaction__c> trans{set;get;}
    public String transid{set;get;}
     public String tname{set;get;}
    public String pname{set;get;}
    public String code{set;get;}
    public String Brand{set;get;}
    public String q{set;get;}
    
    public boolean flag1{set;get;}
    public boolean flag2{set;get;}
    public boolean flagt{set;get;}
    public boolean flag{set;get;}
    public boolean flagb{set;get;}
  
    private ApexPages.StandardSetController stdController;
    Productc__c request;
    public inventoryvfextension(ApexPages.StandardSetController stdController){
        
      this.stdController = stdController;
        this.pro = (Productc__c)stdController.getRecord();
         
        //flag1 for search
        flag1=false;
        flag2=false;
        flagt=false;
        flag=false;
        flagb=false;
    }
    public void search(){
        product= new list<Productc__c>();
        
        //to get fields on search 
        q='select name,Code_Barcode__c,Brand__r.name,Product_SKU__c,MRP__c,Quantity_In__c,Quantity_In_Store__c,Quantity_Out__c,Availability__c from Productc__c ';
        
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
            flagt=false;
        }
    }
    public void SearchBrand(){
        
        flag=false;
        flagb=true;
        flag1=false;
        brandlist=[select name,(select name,Code_Barcode__c,Brand__r.name,Product_SKU__c,MRP__c from Products__r) from account where name like:brand];
    }
    public pagereference home(){
        
        PageReference pr = new PageReference('/apex/imsvfp'); 
        pr.setRedirect(true);
        return pr;
    }
    public pagereference newproduct(){
        //adding new product record.  
        PageReference pr = new PageReference('/apex/newproductvf'); 
        pr.setRedirect(true);
        return pr;
    }
    public void productinfo(){
        flag=true;
        flag1=false;
        flag2=true;
        flagt=false;
        product1=[select id,name,Code_Barcode__c,Brand__r.name,Product_SKU__c,MRP__c,Amount_of_Measuring_Type__c,Measuring_Type__c,Quantity_In__c,Quantity_In_Store__c,Quantity_Out__c,Availability__c from Productc__c where id=:productid];
        system.debug(product);
    }
    public void transinfo(){
        flag1=true;
        flag2=true;
        flagt=true;
        trans=[select name,Order_Placed_Date__c,Order_Status__c,Product_C__c,Quantity__c,Transaction_Type__c from Transaction__c where Product_C__c=:transid ];
        system.debug(trans);
    }
    public pagereference placeorder(){
         
	      pagereference pg=new pagereference('/apex/placeordervf?att='+transid+'&&att1='+tname);
       return pg;
    }
    public void viewallproducts(){
        flag1=false;
        flag2=false;
        flag=false;
        flagt=false;
        flagb=false;
        brand=null;
        pname=null;
        code=null;
        brandlist=null;
    }
 
}