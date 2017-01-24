public class DetailPageContoller{
   public Boolean flag {get;set;}
   public Campaign campaigns;
   ApexPages.StandardController controllerReference;
   
    public DetailPageContoller(ApexPages.StandardController controller) {
    	campaigns=(Campaign)Controller.getRecord();
        flag=true;
        controllerReference=controller;
    }

    public PageReference onEdit() {
        flag=false;
        return null;
    }
    
    public  PageReference save() {    	
    	controllerReference.save();
    	flag=true;
    	return Apexpages.currentPage();
    }
    
    public  PageReference cancel() {    	
    	controllerReference.cancel();
    	flag=true;
    	return Apexpages.currentPage();
    }
    
}
