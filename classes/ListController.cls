public  class ListController {

    Boolean flag=true;
	public String selectedView {get;set; }
	List<SelectOption> op;
	String[] ps= new String[]{};
	public  List<Campaign> campaigns {get;set;}
	public String queryString {get;set;}
   	String query, baseQuery;
    /*public PageReference onLoad() {
        campaigns = [select id,Name,Status,Type,StartDate from Campaign order by LastModifiedDate desc];
        return null;
    }*/
    public List<SelectOption> getItems() {
		if (flag==true) {
			op.add(new SelectOption('Recently Modified', 'Recently Modified'));
        	op.add(new SelectOption('All Campaigns', 'All Campaigns'));
       	 	op.add(new SelectOption('All Active Campaigns', 'All Active Campaigns'));
       		op.add(new SelectOption('Inactive Campaigns', 'Inactive Campaigns'));
         	flag=false;
        }
		return op;
   }

    public ApexPages.StandardSetController con {
        get {
                if(con == null) {
                    /*String whereString=whereClause();
               	    String orderString=orderByClause();
                    String q ='select id, Name,Status,Type,StartDate from Campaign' +' '+ whereString+ ' '+orderString;*/
                    con = new ApexPages.StandardSetController(Database.query(query));
                    //here you can set the record size to display
                    con.setPageSize(4);
                }
                return con;
        }
        set;
    }

    public ListController(ApexPages.StandardController controller) {
    }

    public ListController() {
        campaigns = new List<Campaign>();
        op = new List<SelectOption>();
        flag = true;
        selectedView = 'Recently Modified';
        generateQuery();
        campaigns = con.getRecords();
        /*whereString='';
        orderString='order by LastModifiedDate desc';
        baseQuery ='select id, Name,Status,Type,StartDate from Campaign' +' '+ whereString+ ' '+orderString;
        campaigns=Database.query(baseQuery);*/
    }

    public void generateQuery() {
        String whereString = whereClause();
        String orderString = orderByClause();
        query = 'select id, Name,Status,Type,StartDate from Campaign' +' '+ whereString+ ' '+orderString;
    }

   public PageReference assignAction() {
        con = null;
        generateQuery();
   		campaigns = con.getRecords();
   		return null;
	}

	 private String whereClause() {
		String whereClauseInsert;
	 	if(selectedView=='Recently Modified') {
	 		whereClauseInsert='';
	 	}
	 	else if(selectedView=='All Campaigns') {
	 		whereClauseInsert='';
	 	}
	 	else if(selectedView=='All Active Campaigns') {
	 		whereClauseInsert='where isActive=true';
	 	}
	 	else if(selectedView=='InActive Campaigns') {
	 		whereClauseInsert='where isActive=false';
	 	}
	 	return whereClauseInsert;
	 }

	 private String orderByClause() {
	 	String orderClauseInsert;
	 	if(selectedView=='Recently Modified') {
	 		orderClauseInsert='order by LastModifiedDate desc';
	 	}
	 	else if(selectedView=='All Campaigns') {
	 		orderClauseInsert='order by StartDate desc';
	 	}
	 	else if(selectedView=='All Active Campaigns') {
	 		orderClauseInsert='order by StartDate desc';
	 	}
	 	else if(selectedView=='InActive Campaigns') {
	 		orderClauseInsert='order by StartDate desc';
	 	}
	 	return orderClauseInsert;
	 }



     public List<Campaign> getlistCampaign(){
         return (List<Campaign>)con.getRecords();
     }

     public Boolean hasNext {
         get {
                 return con.getHasNext();
             }
         set;
     }

     public Boolean hasPrevious {
         get {
             return con.getHasPrevious();
         }
         set;
     }

     public Integer pageNumber {
         get {
             return con.getPageNumber();
         }
         set;
     }

     public void first() {
         con.first();
         campaigns = con.getRecords();
     }

     public void last() {
         con.last();
         campaigns = con.getRecords();
     }

     public void previous() {
         con.previous();
         campaigns = con.getRecords();
     }

     public void next() {
        con.next();
        campaigns = con.getRecords();
     }

     public void cancel() {
         con.cancel();
     }




    //Navigate to Next page

}