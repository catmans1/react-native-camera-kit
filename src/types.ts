export enum CameraType {
  Front = 'front',
  Back = 'back',
}

export type CodeFormat =
  | 'aztec'
  | 'code-128'
  | 'code-39'
  | 'code-39-mod-43'
  | 'code-93'
  | 'data-matrix'
  | 'ean-13'
  | 'ean-8'
  | 'interleaved-2-of-5'
  | 'itf-14'
  | 'pdf-417'
  | 'qr'
  | 'upc-e'
  | 'codabar'
  | 'upc-a'
  | 'unknown';

export type TorchMode = 'on' | 'off';

export type FlashMode = 'on' | 'off' | 'auto';

export type FocusMode = 'on' | 'off';

export type ZoomMode = 'on' | 'off';

export type ResizeMode = 'cover' | 'contain';

export type CaptureData = {
  uri: string;
  name: string;
  height: number;
  width: number;
  // Android only
  id?: string;
  path?: string;
  // iOS only
  size?: number;
};

export type CameraApi = {
  capture: () => Promise<CaptureData>;
  requestDeviceCameraAuthorization: () => Promise<boolean>;
  checkDeviceCameraAuthorizationStatus: () => Promise<boolean>;
};
