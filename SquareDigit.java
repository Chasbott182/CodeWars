
public class SquareDigit {

    public int squareDigits(int n) {
        // TODO Implement me
        //create an array to store the numbers
        int[] x = new int[4];
        //Loop through the array and add the remainder of each number.
        for (int i = 3; i >= 0; i--){
            x[i] = n % 10;
            n = n / 10;
            System.out.println(x[i]);
        }
        //Loop through and square each number in each index.
        for (int a = 0; a < x.length; a++){
            x[a] = x[a]*x[a];
        }
        //Convert to string and concat
        StringBuilder builder = new StringBuilder();
        for (int num: x){

            builder.append(num);
        }
        n = Integer.parseInt(builder.toString());
        return n;
    }

}

/* Best Solution 
 public int squareDigits(int n) {
    String result = "";

    while (n != 0) {
      int digit = n % 10 ;
      result = digit*digit + result ;
      n /= 10 ;
    }

    return Integer.parseInt(result) ;
  }
*/