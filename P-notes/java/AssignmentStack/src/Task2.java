public class Task2{
  private int num = 0;
  private int denum = 0;
  private String comb = "";

  public Task2(int n,int r){
    setNum((permutations(n)));
    setdenum((permutations(r)));
    System.out.println(getNum() + " " + getdenum());
    caluc_comb(n, r);
  }

  private void setNum(int n){
    this.num = n; 
  }

  private void setdenum(int r){
    this.denum = r; 
  }

  private int getNum(){
    return this.num;
  }

  private int getdenum(){
    return this.denum;
  }

  private String caluc_comb(int n, int r) {
    if (comb.length() > 0) {
        return this.comb;
    } else {
        int diff = permutations(n-r);
        int results = getNum() / (getdenum() * diff);
        this.comb = Integer.toString(results); 
        return this.comb;
    }
  }

  @Override
  public String toString(){
    return comb;
  }

  public static int permutations(int n) {
        // Base case: 0! and 1! both return 1
        if (n == 0 || n == 1) {
            return 1;
        }
        // Recursive step: n! = n * (n-1)!
        return n * permutations(n - 1);
    }
}
