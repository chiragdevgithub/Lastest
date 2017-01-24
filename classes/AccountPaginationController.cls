public class AccountPaginationController {

    public ApexPages.StandardSetController con {
        get {
                if(con == null) {
                    con = new ApexPages.StandardSetController(
                        Database.getQueryLocator(
                            [Select
                                Id
                                , Name
                                , AccountNumber
                                , Type
                            FROM
                                Account
                            ORDER BY
                                Name
                            LIMIT
                                100
                            ]
                        )
                    );
                    //here you can set the record size to display
                    con.setPageSize(3);
                }
                return con;
        }
        set;
    }

    public List<Account> getlistAccount(){
        return (List<Account>)con.getRecords();
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
    }

    public void last() {
        con.last();
    }

    public void previous() {
        con.previous();
    }

    public void next() {
        con.next();
    }

    public void cancel() {
        con.cancel();
    }


}