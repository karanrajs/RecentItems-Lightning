({
	doInit : function(component, event, helper) {
		var action = component.get("c.getRecentRecords");
        var fields = component.get("v.fields");
        action.setParams({
            ObjectName : component.get("v.object"),
            limits : component.get("v.limit"),
            fieldstoget : fields.join()
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
            	component.set("v.latestRecords",response.getReturnValue());
              	var retRecords = response.getReturnValue();
                retRecords.forEach(function(s) {
                	var tableRow = document.createElement('tr');
                    fields.forEach(function(field){ 
                    	var tableData = document.createElement('td');
                        var tableDataNode = document.createTextNode(s[field]);
                        tableData.appendChild(tableDataNode);
                        tableRow.appendChild(tableData);
                   	});
                    document.getElementById("data").appendChild(tableRow);
                 });
             }else if (state === "ERROR") {
                console.log('Error');
            }
        });
        $A.enqueueAction(action);
	}
})