/*---------------------------------------------------------------------
**
**  Fichero:
**    ld_script.ld  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Script de enlazado
**
**  Notas de diseño:
**
**-------------------------------------------------------------------*/

SECTIONS
{
    . = 0x0C000000;
    .data : {
      *(.data)
      *(.rodata) 
    }
    .bss : { 
      *(.bss)
    }
    .text : { 
      *(.text)
    }
    PROVIDE( end = . );
	PROVIDE (_stack = 0x0c700800);
}
