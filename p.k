#define __CBLIB_SOURCE
#include "cblib.cb"








int main(unsigned int argc, char** argv){
	long number;
  char op;
  long number2;
  long answer = 0;
  printf("Enter an integer: ");  
  
  // reads and stores input
  scanf("%i", &number);

  printf("Enter an op: ");

  scanf("%c", &op);

  printf("Enter an integer: ");

  scanf("%i", &number2);

  printf("Calculating: %i %c %i\n", number, op, number2);
  switch (op) {
    case '+'{
      answer = number+number2;
      break;
    }
    case '-'{
      answer = number-number2;
      break;
    }
    case '*'{
      answer = number*number2;
      break;
    }
    case '/'{
      answer = number/number2;
      break;
    }
    case '^'{
      answer = pow(number, number2);
      break;
    }
    case 'x'{
      answer = number^number2;
      break;
    }
  }


  printf("Answer: %i\n", answer);

  return answer;

}
