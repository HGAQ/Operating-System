#define O_RDONLY  0x000
#define O_WRONLY  0x001
#define O_RDWR    0x002
#define O_APPEND  0x004
#define O_TRUNC   0x400
#define O_CREATE  0x40
#define O_DIRECTORY 0x0200000

#define AT_FDCWD -100 /*if relative*/

/* Bits in the third argument to `waitpid'.  */
#define	WNOHANG		1	/* Don't block waiting.  */
#define	WUNTRACED	2	/* Report status of stopped children.  */
#define WCONTINUED	8	/* Report continued child.  */
