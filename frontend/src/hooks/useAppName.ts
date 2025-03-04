import System from "@/models/system";
import { useState } from "react";
import { useEffect } from "react";


/**
 * 获取App的名称
 * @returns 
 */
export function useAppName(): string {
    const [appName, setCustomAppName] = useState('');
    useEffect(() => {
      const fetchCustomAppName = async () => {
        const { appName } = await System.fetchCustomAppName();
        console.log(appName, '==========appName====');
        
        setCustomAppName(appName || "");
      };
      fetchCustomAppName();
    }, []);

    return appName;
}