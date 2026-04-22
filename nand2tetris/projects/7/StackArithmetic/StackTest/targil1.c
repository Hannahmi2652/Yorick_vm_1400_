#include <stdio.h>
#include <time.h>
#include <sys/types.h>
#include <unistd.h>
#include <pthread.h>
#include <stdlib.h>
void * MyThreadFunction(void * param)
{
 for (int i = 0; i < 10; i++)
 {
 printf("Thread %d %d\n", (int) param, i);
 sleep(1);
//Q: What does the sleep function do?
 }
 printf("From thread: %d %lu\n",(int) param, pthread_self());
 //Q: What does this function return?
 return (void *) pthread_self();
}
int main(int argc, char** argv)
{
 pthread_t *ThreadId;
 //Q: What is the size of a pthread_t?
 unsigned int numThreads;
 int retVal;
 pthread_t res;
 srand((unsigned int)time(NULL));
 numThreads = rand() % 3 + 3;
 ThreadId = malloc(numThreads * sizeof(pthread_t));
 for (int i = 0; i < numThreads; i++)
 {
 pthread_create (&ThreadId[i], NULL, MyThreadFunction, (void *)&i);
 //Q: What are the parameters of this function?
//Q: How can we tell if the thread creation worked?
 }


 for (int i = 0; i < numThreads; i++)
 {

 pthread_join (ThreadId[i],(void*) &res);
 //Q: How can we tell if the thread finished successfully?
 printf("From main: %d %lu\n", i, res);
 //Q: Why is the order of threads different from the printf from within
the thread (From thread:)
 }
 return 0;
}