using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_DAL
{
    public static class HelperUtil
    {
        public static string FormatTime(int timeInSec)
        {
            int hours = (int)(Math.Floor((double)(timeInSec / 3600)));
            timeInSec = timeInSec % 3600;
            int minutes = (int)(Math.Floor((double)(timeInSec / 60)));
            timeInSec = timeInSec % 60;
            return $"{hours}:{minutes}:{timeInSec}";
        }

        public static int CalculateSeconds(string s)
        {
            int timeInSec = 0;
            if (!string.IsNullOrEmpty(s))
            {
                string[] rSati = s.Split(':');
                int sati = int.Parse(rSati[0]);
                int minute = int.Parse(rSati[1]);
                int sekunde = int.Parse(rSati[2]);

                timeInSec += (sati * 3600) + (minute * 60) + sekunde;

            }

            return timeInSec;
        }
    }
}
