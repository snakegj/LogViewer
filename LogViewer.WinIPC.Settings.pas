{
  Copyright (C) 2013-2017 Tim Sinaeve tim.sinaeve@gmail.com

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
}

unit LogViewer.WinIPC.Settings;

interface

uses
  System.Classes,

  Spring;

type
  TWinIPCSettings = class(TPersistent)
  private
    FOnChanged : Event<TNotifyEvent>;

    function GetOnChanged: IEvent<TNotifyEvent>;

  protected
    procedure Changed;
    procedure Assign(Source: TPersistent); override;

  public
    property OnChanged: IEvent<TNotifyEvent>
      read GetOnChanged;
  end;

implementation

{$REGION 'property access methods'}
function TWinIPCSettings.GetOnChanged: IEvent<TNotifyEvent>;
begin
  Result := FOnChanged;
end;
{$ENDREGION}

{$REGION 'protected methods'}
procedure TWinIPCSettings.Changed;
begin
  FOnChanged.Invoke(Self);
end;
{$ENDREGION}

{$REGION 'public methods'}
procedure TWinIPCSettings.Assign(Source: TPersistent);
begin
  inherited;
//
end;
{$ENDREGION}
end.