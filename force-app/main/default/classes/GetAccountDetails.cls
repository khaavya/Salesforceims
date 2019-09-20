public class GetAccountDetails {

    public List<account> ac{set;get;}
    public GetAccountDetails(){
        ac=[select id,name from account];
    }
	
}