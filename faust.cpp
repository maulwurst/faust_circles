#include "faust.hpp"
#include "simple.hpp"
#include "config.h"
#include <circle/logger.h>
#include <assert.h>


CFaust::~CFaust (void)
{
   //s_pThis = 0;
}


boolean CFaust::Initialize (void)
{
    m_Simple.init(SAMPLE_RATE);
    m_Simple.set_freq(440);
    return true;
}

