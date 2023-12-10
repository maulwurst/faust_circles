#ifndef _faust_h
#define _faust_h


#include "simple.hpp"

class CFaust
{
public:

    ~CFaust(void);


private:

	unsigned m_nSampleCount;


    simple m_Simple;

    // static CFaust *s_pThis;
};

#endif /* _faust_h */
