unit ConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Drivers.MSSQL, 
  System.SysUtils, System.Classes, Aurelius.Comp.Connection;

type
  TPythoConnection = class(TDataModule)
    AureliusConnection1: TAureliusConnection;
  private
  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;
    
  end;

var
  PythoConnection: TPythoConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses 
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

class function TPythoConnection.CreateConnection: IDBConnection;
begin 
  Result := PythoConnection.AureliusConnection1.CreateConnection;
end;

class function TPythoConnection.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;



end.
