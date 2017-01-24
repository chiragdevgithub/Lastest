/**
 * Pallindrome class is to check whether a particular String is pallindrome or not by using isPalindrome method.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			09/01/17					Initial version
 */
public class Pallindrome {
	/**
	 * Checks whether message is pallindrome or not and returns boolean value.
	 */	
	public Boolean isPalindrome(String message) {
		if(message==message.reverse()){
			return true;
		}
		else{
			return false;
		}
	}
}