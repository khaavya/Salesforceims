public class imsapex {
    //intialize sobject variables
    public list<Productc__c> product{set;get;}
     public list<Productc__c> productsearch{set;get;}
    public list<account> brandlist{set;get;}
    
    //flags for abstraction/ hiding details 
    public boolean flag1{set;get;}
    public boolean flagb{set;get;}
     public boolean flagc{set;get;}
    public boolean flagL{set;get;}
    public boolean flagL1{set;get;}
    
    
    public String pname{set;get;}
    public String code{set;get;}
    public String Brand{set;get;}
    
    public String q{set;get;}
    
    public imsapex(){
        product=new list<Productc__c>();
        product=[select name,Code_Barcode__c,Brand__r.name,Product_SKU__c,MRP__c from Productc__c];
        flag1=false;
      
        flagb=false;
        flagc=false;
    }
    public void search(){        
        //to get fields on search 
        q='select name,Code_Barcode__c,Brand__r.name,Product_SKU__c,Quantity_In__c,MRP__c,Quantity_In_Store__c,Quantity_Out__c,Availability__c from Productc__c ';
        
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
            productsearch = database.query(q);
            flag1=true;
            flagc=false;
        }
        
    }
    public pagereference products(){
        flag1=false;
    
        flagb=false;
        flagc=false;
        brand=null;
        pname=null;
        code=null;
        brandlist=null;
        selcat1=null;
        selsub=null;
        picklist=null;
        product=[select name,Code_Barcode__c,Brand__r.name,Product_SKU__c,MRP__c from Productc__c];
        return null;     
    } 
    public void SearchBrand(){
     
        if(Brand==''|| Brand==null)
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Enter a value'));
        else{
             q='select name,(select name,Code_Barcode__c,Brand__r.name,Product_SKU__c,MRP__c from Products__r) from account ';
            if(brand!=null && brand!='')
            {
                q = q+' where name like \'%'+brand+'%\'';
            }
            brandlist = database.query(q);
            	 flagb=true;
            flagc=false;
        }
    }
    
    public pagereference store(){
        PageReference pr = new PageReference('/apex/storevfp'); 
        pr.setRedirect(true);
        return pr;
    }
    public PageReference imsm(){
        
        PageReference pr = new PageReference('/apex/inventoryvf'); 
        pr.setRedirect(true);
        return pr;
    }   
     public String selCat1 {get;set;}
     public String selsub {get;set;}
     public list<Productc__c> picklist {set;get;}
   
    
    public List<selectOption> getCatnames() {
        List<selectOption> CatOptions = new List<selectOption>();
        CatOptions.add(new selectOption('--Category--','--Category--'));
        for(Category__c objCat : [select name from Category__c]){
            CatOptions.add(new selectOption(objCat.name,objCat.name));
        }
        return CatOptions;
    }
     public List<selectOption> getSubnames() {
        
        List<selectOption> SubOptions = new List<selectOption>();
        SubOptions.clear();
        
        SubOptions.add(new selectOption('--Choose--','--Sub-Category--'));
        for(Sub_Category__c objSub : [select Id,name,Category__c from Sub_Category__c where category__r.name=:selCat1]){
            SubOptions.add(new selectOption(objSub.name,objSub.name));
        }
        return SubOptions;
    }
    
    public void pick1(){
        flag1=false;
      
        flagb=false;
       
        flagc=true;
        flagL=true;
        flagL1=false;
        picklist = [select id,name,Code_Barcode__c,Brand__r.name,Product_SKU__c,MRP__c,Sub_Category__r.name from Productc__c where Sub_Category__r.name =: selsub ];
    }
    
}