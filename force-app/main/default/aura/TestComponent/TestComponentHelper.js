({
	helperAdditionMethod : function(component, event) {
	var firstNumber=parseInt(component.get("v.fNumber"));
     var secondNumber=parseInt(component.get("v.sNumber"));
     var addition = component.get("c.getAddResult");
      addition.setParams({"fstNumber":firstNumber,"secNumber":secondNumber});
      addition.setCallback(this,function(response){
          var addResult = response.getReturnValue();
          //alert(addResult);
          component.set("v.result",(addResult));
      });
 $A.enqueueAction(addition);
	
	}
})