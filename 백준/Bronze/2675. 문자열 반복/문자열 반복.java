import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int T = sc.nextInt();
		for(int t = 0; t < T; t++) {
			int R = sc.nextInt();	// 반복 횟수
			// 문자열 입력받는다
			String S = sc.next();
			
			for(int i = 0; i < S.length(); i++) {
				for(int j = 0; j < R; j++) {
					System.out.print(S.charAt(i));
				}
			}
			System.out.println();
		}	// 테케 끝
	}
}