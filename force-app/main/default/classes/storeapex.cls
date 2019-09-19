public class storeapex {

    public list<Productc__c> product{set;get;}
    public String pname{set;get;}
    public String code{set;get;}
    public String q{set;get;}
    public boolean flag1{set;get;}
    public list<wrapccount> wcl{set;get;}
    public list<Productc__c> selectedp{set;get;} 

    public storeapex(){
        //flag1 for search
        flag1=false;
      //intialize Wrapper list
          wcl=new list<wrapccount>();
        for(Productc__c p:[select name,Code_Barcode__c,Brand__c,Product_SKU__c from Productc__c]){
        wcl.add(new wrapccount(p));
        }
    
    }
    public pagereference home(){
        
       PageReference pr = new PageReference('/apex/imsvfp'); 
       pr.setRedirect(true);
        return pr;
    }

     public void search(){
         //flag1 for rendered
         flag1=true;
       //to get fields on search 
      q='select name,Code_Barcode__c,Brand__c,Product_SKU__c from Productc__c ';

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
    }
    public pagereference newproduct(){
     //adding new product record.  
        PageReference pr = new PageReference('/apex/'); 
       pr.setRedirect(true);
        return pr;
    }
   
public void processselected(){
  //adding isselected==true in a container list.  
  
        selectedp=new list<Productc__c>();
        for(wrapccount wrapobj:wcl){
            if(wrapobj.isselected==true){
                selectedp.add(wrapobj.namep);
            }
        }
    }
    public class wrapccount{
        //wrapper class
        public Productc__c namep{set;get;}
        public boolean isselected{set;get;}
        public wrapccount(Productc__c p){
            namep=p;
            isselected= false;
        }
    }
}