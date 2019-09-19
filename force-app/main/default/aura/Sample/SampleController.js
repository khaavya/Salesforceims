({
	doinit : function(component, event, helper) {
		var action=component.get("c.callwrapper");
        
        action.setCallback(this, function(response){
            component.set("v.cat",response.getReturnValue());
        })  
        $A.enqueueAction(action);
	},
    
    savecat: function(component, event, helper) {
        var cat=component.get("v.cat");
        var action=component.get("c.saveCat");
        action.setParams({
            
            "accdetails":acc
        })
        
        action.setCallback(this, function(response){
            
            alert(response.getReturnValue().Name+' created successfully');
        })
        
        $A.enqueueAction(action);
        
        
    },
    cancel: function(component, event, helper) {
        
    }

})