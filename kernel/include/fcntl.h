#define O_RDONLY  0x000
#define O_WRONLY  0x001
#define O_RDWR    0x002
#define O_APPEND  0x004
#define O_TRUNC   0x400
#define O_CREATE  0x40
#define O_DIRECTORY 0x0200000

#define AT_FDCWD    -100 /*if relative*/
#define AT_REMOVEDIR 0x200
/* Bits in the third argument to `waitpid'.  */
#define	WNOHANG		1	/* Don't block waiting.  */
#define	WUNTRACED	2	/* Report status of stopped children.  */
#define WCONTINUED	8	/* Report continued child.  */
#define PROT_NONE 0
#define PROT_READ 1
#define PROT_WRITE 2
#define PROT_EXEC 4

#define MAP_PRIVATE 0x2
#define MAP_FIXED 0x10
#define MAP_ANONYMOUS 0x20
#define MAP_POPULATE 0x8000
#define MREMAP_FIXED 0x2
